module AArch64
  module Instructions
    # LDRB (immediate) -- A64
    # Load Register Byte (immediate)
    # LDRB  <Wt>, [<Xn|SP>{, #<pimm>}]
    class LDRB_unsigned < Instruction
      def initialize rt, rn, imm12
        @rt    = check_mask(rt, 0x1f)
        @rn    = check_mask(rn, 0x1f)
        @imm12 = check_mask(imm12, 0xfff)
      end

      def encode
        LDRB_imm(@imm12, @rn, @rt)
      end

      private

      def LDRB_imm imm12, rn, rt
        insn = 0b00_111_0_01_01_0_00000000000_00000_00000
        insn |= ((apply_mask(imm12, 0xfff)) << 10)
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rt, 0x1f))
        insn
      end
    end
  end
end
