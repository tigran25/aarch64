module AArch64
  module Instructions
    # PACDB, PACDZB -- A64
    # Pointer Authentication Code for Data address, using key B
    # PACDB  <Xd>, <Xn|SP>
    # PACDZB  <Xd>
    class PACDB < Instruction
      def initialize rd, rn, z
        @rd = check_mask(rd, 0x1f)
        @rn = check_mask(rn, 0x1f)
        @z  = check_mask(z, 0x01)
      end

      def encode _
        PACDB(@z, @rn, @rd)
      end

      private

      def PACDB z, rn, rd
        insn = 0b1_1_0_11010110_00001_0_0_0_011_00000_00000
        insn |= ((z) << 13)
        insn |= ((rn) << 5)
        insn |= (rd)
        insn
      end
    end
  end
end
