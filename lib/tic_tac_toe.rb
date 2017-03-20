class TicTacToe
  attr_reader :players

  def initialize(*names)
    self.players = {:exes => '', :ohs => ''}
  end

  private
  attr_writer :players

end
