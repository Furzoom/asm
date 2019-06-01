1
  cmp 1, 1          # SF = 0  OF = 0  E
  cmp 1, 2          # SF = 0  OF = 0  G
  cmp 2, 1          # SF = 1  OF = 0  L

2
  cmp 0xFF, 0xFE    # SF = 1  OF = 0  L
  cmp -1, -2

  cmp 0xFE, 0xFF    # SF = 0  OF = 0  G
  cmp -2, -1

3
  cmp 0xFF, 0x01    # SF = 0  OF = 0  G
  cmp -1, 1

  cmp 0x01, 0xFF    # SF = 1  OF = 0  L
  cmp 1, -1

4
  cmp 0x80, 0x7F    # SF = 1  OF = 1  G
  cmp -128, 127
  
  cmp 0x7F, 0x80    # SF = 0  OF = 1  L
  cmp 127, -128

