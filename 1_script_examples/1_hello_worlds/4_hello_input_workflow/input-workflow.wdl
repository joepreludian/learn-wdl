version 1.0

workflow HelloInput {
  input {
    String name
    String hello = "Hello from branch_test2 - COMMIT 1"
  }
  call WriteGreeting {
    input : name = name
  }
}

task WriteGreeting {
  input {
    String name
  }
  
  # specify parameter value (name) in `input.json` file
  command {
    echo 'hello ${name}!'
  }
  output {
    File response = stdout()
  }
  runtime {
   docker: 'ubuntu:latest'
  }
}


