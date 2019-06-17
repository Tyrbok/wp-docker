require 'open3'

class DockerManager
    def get_new_wpd_id
        command = "docker ps --all"
        stdout, stderr, status = Open3.capture3(command)

        match = stdout.scan(/wpd_.+_(\d+)/)
        current_ids = match.uniq

        if current_ids.count > 90
            puts "No more available ids"
            exit
        end

        new_id = nil
        while new_id == nil
            rand_id = rand(10..99)
            if !match.include? rand_id
                new_id = rand_id
            end
        end

        return new_id
    end
end