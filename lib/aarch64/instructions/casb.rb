module AArch64
  module Instructions
    # CASB, CASAB, CASALB, CASLB -- A64
    # Compare and Swap byte in memory
    # CASAB  <Ws>, <Wt>, [<Xn|SP>{,#0}]
    # CASALB  <Ws>, <Wt>, [<Xn|SP>{,#0}]
    # CASB  <Ws>, <Wt>, [<Xn|SP>{,#0}]
    # CASLB  <Ws>, <Wt>, [<Xn|SP>{,#0}]
    class CASB < Instruction
      def initialize rs, rt, rn, l, o0
        @rs = check_mask(rs, 0x1f)
        @rt = check_mask(rt, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @l  = check_mask(l, 0x01)
        @o0 = check_mask(o0, 0x01)
      end

      def encode _
        CASB(@l, @rs, @o0, @rn, @rt)
      end

      private

      def CASB l, rs, o0, rn, rt
        insn = 0b00_0010001_0_1_00000_0_11111_00000_00000
        insn |= ((l) << 22)
        insn |= ((rs) << 16)
        insn |= ((o0) << 15)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
