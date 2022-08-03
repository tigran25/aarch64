module AArch64
  module Instructions
    # LDR (literal) -- A64
    # Load Register (literal)
    # LDR  <Wt>, <label>
    # LDR  <Xt>, <label>
    class LDR_lit_gen < Instruction
      def initialize rt, imm19, size
        @rt    = rt
        @imm19 = imm19
        @size  = size
      end

      def encode
        LDR_lit_gen(@size, unwrap_label(@imm19), @rt)
      end

      private

      def LDR_lit_gen size, imm19, rt
        insn = 0b00_011_0_00_0000000000000000000_00000
        insn |= ((apply_mask(size, 0x3)) << 30)
        insn |= ((apply_mask(imm19, 0x7ffff)) << 5)
        insn |= (apply_mask(rt, 0x1f))
        insn
      end
    end
  end
end
