module AArch64
  module Instructions
    # LDAXP -- A64
    # Load-Acquire Exclusive Pair of Registers
    # LDAXP  <Wt1>, <Wt2>, [<Xn|SP>{,#0}]
    # LDAXP  <Xt1>, <Xt2>, [<Xn|SP>{,#0}]
    class LDAXP < Instruction
      def initialize rt1, rt2, rn, sf
        @rt1 = check_mask(rt1, 0x1f)
        @rt2 = check_mask(rt2, 0x1f)
        @rn  = check_mask(rn, 0x1f)
        @sf  = check_mask(sf, 0x01)
      end

      def encode _
        LDAXP(@sf, @rt2, @rn, @rt1)
      end

      private

      def LDAXP sz, rt2, rn, rt
        insn = 0b1_0_001000_0_1_1_11111_1_00000_00000_00000
        insn |= ((sz) << 30)
        insn |= ((rt2) << 10)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
