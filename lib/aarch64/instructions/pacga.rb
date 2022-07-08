module AArch64
  module Instructions
    # PACGA -- A64
    # Pointer Authentication Code, using Generic key
    # PACGA  <Xd>, <Xn>, <Xm|SP>
    class PACGA < Instruction
      def initialize rd, rn, rm
        @rd = rd
        @rn = rn
        @rm = rm
      end

      def encode
        PACGA(@rm.to_i, @rn.to_i, @rd.to_i)
      end

      private

      def PACGA rm, rn, rd
        insn = 0b1_0_0_11010110_00000_001100_00000_00000
        insn |= ((apply_mask(rm, 0x1f)) << 16)
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rd, 0x1f))
        insn
      end
    end
  end
end
