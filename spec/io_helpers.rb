require 'stringio'

module IOHelpers
  def self.simulate_stdin(*input, &block)
    stdin = StringIO.new
    input.flatten.each { |s| stdin.puts(s) }
    stdin.rewind

    plain_stdin, $stdin = $stdin, stdin
    yield
  ensure
    $stdin = plain_stdin
  end
end
