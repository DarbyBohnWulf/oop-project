class Player
attr_reader :name

def initialize(*handle)
  @@players.push(self)
  if handle[0]
    self.name = handle[0]
  else
    self.name = "Player#{@@players.count}"
  end
end

def self.players
  @@players
end

def make_move
  App.interpret_options
end

private
attr_writer :name
@@players = []

end
