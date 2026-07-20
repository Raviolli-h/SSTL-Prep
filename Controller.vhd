-- Block A : Credit-Base Flow Control
--      Small counter module that monitors FIFO Fill level
--          
--          When FIFO has room for +8 bytes, it sends a FCT pulse back out to the transmitter
--          
--          if FIFO starts filling up (because TREADY), IT STOPS ISSUING FTC SO THE TRANSMITTER RUNS OUT OF CREDITS BEFORE YOUR FIFO OVERFLOWS


