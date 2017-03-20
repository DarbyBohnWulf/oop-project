class Player
attr_reader :name, :players

def initialize(*handle)
  if players.nil?
    players = [self]
  else
    players.push (self)
  end
  if handle[0].nil?
    self.name = "Player#{players.count}"
  else
    self.name = handle[0]
  end
end

private
attr_writer :name, :players

end
