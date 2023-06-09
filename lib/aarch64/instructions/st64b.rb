module AArch64
  module Instructions
    # ST64B -- A64
    # Single-copy Atomic 64-byte Store without Return
    # ST64B  <Xt>, [<Xn|SP> {,#0}]
    class ST64B < Instruction
      def initialize rt, rn
        @rt = check_mask(rt, 0x1f)
        @rn = check_mask(rn, 0x1f)
      end

      def encode _
        ST64B(@rn, @rt)
      end

      private

      def ST64B rn, rt
        insn = 0b11_111_0_00_0_0_1_11111_1_001_00_00000_00000
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
