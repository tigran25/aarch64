module AArch64
  module Instructions
    # UDIV -- A64
    # Unsigned Divide
    # UDIV  <Wd>, <Wn>, <Wm>
    # UDIV  <Xd>, <Xn>, <Xm>
    class UDIV < Instruction
      def initialize rd, rn, rm, sf
        @rd = check_mask(rd, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @rm = check_mask(rm, 0x1f)
        @sf = check_mask(sf, 0x01)
      end

      def encode _
        UDIV(@sf, @rm, @rn, @rd)
      end

      private

      def UDIV sf, rm, rn, rd
        insn = 0b0_0_0_11010110_00000_00001_0_00000_00000
        insn |= ((sf) << 31)
        insn |= ((rm) << 16)
        insn |= ((rn) << 5)
        insn |= (rd)
        insn
      end
    end
  end
end
