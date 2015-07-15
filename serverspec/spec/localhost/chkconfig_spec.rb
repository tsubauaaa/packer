require 'spec_helper'

# On services
on_services = %w{abrt-ccpp abrt-oops abrtd acpid crond irqbalance kdump network ntpd ntpdate rsyslog sshd sysstat }
on_services.each do |on_service|
on_result = Specinfra.backend.run_command("/sbin/chkconfig --list | grep #{on_service}")
  describe service(on_service) do
    it { should be_enabled if on_result[:stdout] =~ /^#{on_service}/ }
  end
end

# Off services
off_services = %w{atd auditd blk-availability cpuspeed haldaemon ip6tables iptables lvm2-monitor mdmonitor messagebus netconsole netfs postfix psacct quota_nld rdisc restorecond rngd saslauthd smartd svnserve udev-post yum-updateonboot }
off_services.each do |off_service|
off_result = Specinfra.backend.run_command("/sbin/chkconfig --list | grep #{off_service}")
  describe service(off_service) do
    it { should_not be_enabled if off_result[:stdout] =~ /^#{off_service}/ }
  end
end
