module AArch64
  module Instructions
    # LDADD, LDADDA, LDADDAL, LDADDL -- A64
    # Atomic add on word or doubleword in memory
    # LDADD  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDA  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDAL  <Ws>, <Wt>, [<Xn|SP>]
    # LDADDL  <Ws>, <Wt>, [<Xn|SP>]
    # LDADD  <Xs>, <Xt>, [<Xn|SP>]
    # LDADDA  <Xs>, <Xt>, [<Xn|SP>]
    # LDADDAL  <Xs>, <Xt>, [<Xn|SP>]
    # LDADDL  <Xs>, <Xt>, [<Xn|SP>]
    class LDADD < Instruction
      def initialize rs, rt, rn, size, a, r
        @rs   = check_mask(rs, 0x1f)
        @rt   = check_mask(rt, 0x1f)
        @rn   = check_mask(rn, 0x1f)
        @size = check_mask(size, 0x03)
        @a    = check_mask(a, 0x01)
        @r    = check_mask(r, 0x01)
      end

      def encode _
        LDADD(@size, @a, @r, @rs, @rn, @rt)
      end

      private

      def LDADD size, a, r, rs, rn, rt
        insn = 0b00_111_0_00_0_0_1_00000_0_000_00_00000_00000
        insn |= ((size) << 30)
        insn |= ((a) << 23)
        insn |= ((r) << 22)
        insn |= ((rs) << 16)
        insn |= ((rn) << 5)
        insn |= (rt)
        insn
      end
    end
  end
end
