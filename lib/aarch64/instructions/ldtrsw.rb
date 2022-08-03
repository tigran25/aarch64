module AArch64
  module Instructions
    # LDTRSW -- A64
    # Load Register Signed Word (unprivileged)
    # LDTRSW  <Xt>, [<Xn|SP>{, #<simm>}]
    class LDTRSW < Instruction
      def initialize rt, rn, imm9
        @rt   = rt
        @rn   = rn
        @imm9 = imm9
      end

      def encode
        LDTRSW(@imm9, @rn, @rt)
      end

      private

      def LDTRSW imm9, rn, rt
        insn = 0b10_111_0_00_10_0_000000000_10_00000_00000
        insn |= ((apply_mask(imm9, 0x1ff)) << 12)
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rt, 0x1f))
        insn
      end
    end
  end
end
