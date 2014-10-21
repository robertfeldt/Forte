DockerUser = "robertfeldt"
DockerImageName = "forte"
Tag = "0.2.0"

desc "Build forte docker image"
task :build_docker_image do
  # Delete any previous soft links
  sh "rm -f Dockerfile"

  # Soft link the dockerfile since Docker requires the Dockerfile to be in root...
  sh "ln -s docker/forte.Dockerfile Dockerfile"

  # Build the docker image
  sh "docker build -t=\"#{DockerUser}/#{DockerImageName}:#{Tag}\" ."

  # Now clean up the soft link we created
  sh "rm Dockerfile"
end
task :build => :build_docker_image

desc "Run the built docker image"
task :run do
  sh "docker run -t -i #{DockerUser}/#{DockerImageName}:#{Tag}"
end

desc "Stop and rm docker container"
task :stoprm do
  containers = `docker ps -a`
  containers.split(/\n/).each do |line|
    regexp = Regexp.new("^([a-z0-9]+)\\s+" + "#{DockerUser}/#{DockerImageName}")
    m = regexp.match(line)
    if m != nil
      puts "Found container with id: #{m[1]}"
      sh "docker stop #{m[1]}"
      sh "docker rm #{m[1]}"
    end
  end
end

