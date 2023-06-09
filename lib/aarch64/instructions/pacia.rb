module AArch64
  module Instructions
    # PACIA, PACIA1716, PACIASP, PACIAZ, PACIZA -- A64
    # Pointer Authentication Code for Instruction address, using key A
    # PACIA  <Xd>, <Xn|SP>
    # PACIZA  <Xd>
    # PACIA1716
    # PACIASP
    # PACIAZ
    class PACIA < Instruction
      def initialize rd, rn, z
        @rd = check_mask(rd, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @z  = check_mask(z, 0x01)
      end

      def encode _
        PACIA(@z, @rn, @rd)
      end

      private

      def PACIA z, rn, rd
        insn = 0b1_1_0_11010110_00001_0_0_0_000_00000_00000
        insn |= ((z) << 13)
        insn |= ((rn) << 5)
        insn |= (rd)
        insn
      end
    end
  end
end
