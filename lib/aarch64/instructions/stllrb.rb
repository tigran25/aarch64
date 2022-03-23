module AArch64
  module Instructions
    # STLLRB -- A64
    # Store LORelease Register Byte
    # STLLRB  <Wt>, [<Xn|SP>{,#0}]
    class STLLRB
      def encode
        raise NotImplementedError
      end

      private

      def STLLRB rn, rt
        insn = 0b00_001000_1_0_0_11111_0_11111_00000_00000
        insn |= ((rn & 0x1f) << 5)
        insn |= (rt & 0x1f)
        insn
      end
    end
  end
end
