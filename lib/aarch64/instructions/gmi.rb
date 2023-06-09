module AArch64
  module Instructions
    # GMI -- A64
    # Tag Mask Insert
    # GMI  <Xd>, <Xn|SP>, <Xm>
    class GMI < Instruction
      def initialize rd, rn, rm
        @rd = check_mask(rd, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @rm = check_mask(rm, 0x1f)
      end

      def encode _
        GMI(@rm, @rn, @rd)
      end

      private

      def GMI xm, xn, xd
        insn = 0b1_0_0_11010110_00000_0_0_0_1_0_1_00000_00000
        insn |= ((xm) << 16)
        insn |= ((xn) << 5)
        insn |= (xd)
        insn
      end
    end
  end
end
