module AArch64
  module Instructions
    # TSB CSYNC -- A64
    # Trace Synchronization Barrier
    # TSB CSYNC
    class TSB
      def encode
        self.TSB
      end

      private

      def TSB
        0b1101010100_0_00_011_0010_0010_010_11111
      end
    end
  end
end
