require "./require"

r = Ruin.new(640, 480)
r.addEntity(Map, 1000, 1000)
r.addEntity(GrenadeLauncher)
r.addEntity(Player, 320, 240)
r.show
