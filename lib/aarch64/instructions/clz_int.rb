module AArch64
  module Instructions
    # CLZ -- A64
    # Count Leading Zeros
    # CLZ  <Wd>, <Wn>
    # CLZ  <Xd>, <Xn>
    class CLZ_int < Instruction
      def initialize rd, rn, sf
        @rd = rd
        @rn = rn
        @sf = sf
      end

      def encode
        CLZ_int(@sf, @rn, @rd)
      end

      private

      def CLZ_int sf, rn, rd
        insn = 0b0_1_0_11010110_00000_00010_0_00000_00000
        insn |= ((apply_mask(sf, 0x1)) << 31)
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rd, 0x1f))
        insn
      end
    end
  end
end
