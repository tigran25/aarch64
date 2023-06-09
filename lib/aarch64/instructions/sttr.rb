module AArch64
  module Instructions
    # STTR -- A64
    # Store Register (unprivileged)
    # STTR  <Wt>, [<Xn|SP>{, #<simm>}]
    # STTR  <Xt>, [<Xn|SP>{, #<simm>}]
    class STTR < Instruction
      def initialize rt, rn, imm9, size
        @rt   = check_mask(rt, 0x1f)
        @rn   = check_mask(rn, 0x1f)
        @imm9 = check_mask(imm9, 0x1ff)
        @size = check_mask(size, 0x03)
      end

      def encode _
        STTR(@size, @imm9, @rn, @rt)
      end

      private

      def STTR size, imm9, rn, rt
        insn = 0b00_111_0_00_00_0_000000000_10_00000_00000
        insn |= ((size) << 30)
        insn |= ((imm9) << 12)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
