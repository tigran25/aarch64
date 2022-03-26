module AArch64
  module Instructions
    # BFC -- A64
    # Bitfield Clear
    # BFC  <Wd>, #<lsb>, #<width>
    # BFC  <Xd>, #<lsb>, #<width>
    class BFC_BFM
      def initialize d, lsb, width
        @d     = d
        @lsb   = lsb
        @width = width
      end

      def encode
        BFC_BFM(@d.sf, @d.sf, -(@lsb % 32), @width - 1, @d.to_i)
      end

      private

      def BFC_BFM sf, n, immr, imms, rd
        insn = 0b0_01_100110_0_000000_000000_11111_00000
        insn |= ((sf & 0x1) << 31)
        insn |= ((n & 0x1) << 22)
        insn |= ((immr & 0x3f) << 16)
        insn |= ((imms & 0x3f) << 10)
        insn |= (rd & 0x1f)
        insn
      end
    end
  end
end
