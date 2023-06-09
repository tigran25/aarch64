module AArch64
  module Instructions
    # LDPSW -- A64
    # Load Pair of Registers Signed Word
    # LDPSW  <Xt1>, <Xt2>, [<Xn|SP>], #<imm>
    # LDPSW  <Xt1>, <Xt2>, [<Xn|SP>, #<imm>]!
    # LDPSW  <Xt1>, <Xt2>, [<Xn|SP>{, #<imm>}]
    class LDPSW < Instruction
      def initialize rt, rt2, rn, imm7, mode
        @rt   = check_mask(rt, 0x1f)
        @rt2  = check_mask(rt2, 0x1f)
        @rn   = check_mask(rn, 0x1f)
        @imm7 = check_mask(imm7, 0x7f)
        @mode = check_mask(mode, 0x07)
      end

      def encode _
        LDPSW(@mode, @imm7, @rt2, @rn, @rt)
      end

      private

      def LDPSW mode, imm7, rt2, rn, rt
        insn = 0b01_101_0_000_1_0000000_00000_00000_00000
        insn |= ((mode) << 23)
        insn |= ((imm7) << 15)
        insn |= ((rt2) << 10)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
