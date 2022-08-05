module AArch64
  module Instructions
    # LDAPRB -- A64
    # Load-Acquire RCpc Register Byte
    # LDAPRB  <Wt>, [<Xn|SP> {,#0}]
    class LDAPRB < Instruction
      def initialize rt, rn
        @rt = check_mask(rt, 0x1f)
        @rn = check_mask(rn, 0x1f)
      end

      def encode
        LDAPRB(@rn, @rt)
      end

      private

      def LDAPRB rn, rt
        insn = 0b00_111_0_00_1_0_1_11111_1_100_00_00000_00000
        insn |= ((apply_mask(rn, 0x1f)) << 5)
        insn |= (apply_mask(rt, 0x1f))
        insn
      end
    end
  end
end
