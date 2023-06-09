module AArch64
  module Instructions
    # LDTRH -- A64
    # Load Register Halfword (unprivileged)
    # LDTRH  <Wt>, [<Xn|SP>{, #<simm>}]
    class LDTRH < Instruction
      def initialize rt, rn, imm9
        @rt   = check_mask(rt, 0x1f)
        @rn   = check_mask(rn, 0x1f)
        @imm9 = check_mask(imm9, 0x1ff)
      end

      def encode _
        LDTRH(@imm9, @rn, @rt)
      end

      private

      def LDTRH imm9, rn, rt
        insn = 0b01_111_0_00_01_0_000000000_10_00000_00000
        insn |= ((imm9) << 12)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
