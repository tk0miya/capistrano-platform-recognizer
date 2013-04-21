require "capistrano-platform-recognizer/version"

Capistrano::Configuration.instance.load do
  namespace :distro do
    def guess_distro(issue)
      case issue
      when %r{CentOS.*? 5}
        :centos5
      when %r{CentOS.*? 6}
        :centos6
      when %r{Amazon Linux}
        :amazon
      when %r{Red Hat Enterprise.*? 5}
        :rhel5
      when %r{Red Hat Enterprise.*? 6}
        :rhel6
      else
        nil
      end
    end

    def guess_cpu(machine_info)
      case machine_info
      when "x86_64", "amd64"
        :x86_64
      else
        :i386
      end
    end

    task :detect do
      find_servers_for_task(current_task).each do |server|
        osname = capture("uname -s", :hosts => server, :shell => 'bash').chomp
        server.options[:osname] = osname.downcase.to_sym

        if server.options[:osname] == :linux
          issue = capture("cat /etc/issue || lsb_release -d -s", :hosts => server, :shell => 'bash').chomp
          server.options[:distro] = guess_distro(issue)
  
          machine_info = capture("uname -m", :hosts => server, :shell => 'bash').chomp
          server.options[:cpu] = guess_cpu(machine_info)
          server.options[:arch] = guess_cpu(machine_info)
        end
      end
    end

    on :start do
      if top.namespaces.key?(:multistage)
        after "multistage:ensure", "distro:detect"
      else
        detect
      end
    end
  end
end
