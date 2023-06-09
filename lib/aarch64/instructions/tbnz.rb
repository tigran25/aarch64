module AArch64
  module Instructions
    # TBNZ -- A64
    # Test bit and Branch if Nonzero
    # TBNZ  <R><t>, #<imm>, <label>
    class TBNZ < Instruction
      def initialize rt, imm, label, sf
        @rt    = check_mask(rt, 0x1f)
        @imm   = check_mask(imm, 0x1f)
        @label = label
        @sf    = check_mask(sf, 0x1)
      end

      def encode pos
        TBNZ(@sf, @imm, check_mask(unwrap_label(@label, pos), 0x3fff), @rt)
      end

      private

      def TBNZ b5, b40, imm14, rt
        insn = 0b0_011011_1_00000_00000000000000_00000
        insn |= (b5 << 31)
        insn |= (b40 << 19)
        insn |= (imm14 << 5)
        insn |= rt
        insn
      end
    end
  end
end
