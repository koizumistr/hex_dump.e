class HEX_DUMP

insert
   ARGUMENTS

create {ANY}
   make

feature {ANY}
   make
      local
         f: TEXT_FILE_READ; i, j: INTEGER; s: STRING
      do
         if argument_count = 0 then
            std_output.put_string("Usage: " + argument(0) + " file%N")
            die_with_code(-1)
         end
         std_output.put_string("--" + argument(1) + "--%N")
         create f.connect_to(argument(1))
         from
--	    std_input.read_character
            i := 1
            j := 0
            f.read_character
         until
            f.end_of_input
--	    not std_input.end_of_input
         loop
            if i = 1 then
               std_output.put_string(j.to_hexadecimal + "0  ")
               j := j + 1
            end
--	    std_output.put_string("Input: ")
--	    std_output.put_character(f.last_character)
--	    std_output.put_new_line
--	    s := f.last_character.to_bit.to_integer_8.to_hexadecimal

            s := f.last_character.to_integer_8.to_hexadecimal
            s.keep_tail(2)
            s.to_lower
            i := i + 1
            std_output.put_string(s)
            if i > 16 then
               std_output.put_new_line
               i := 1
            elseif i = 9 then
               std_output.put_string("  ")
            else
               std_output.put_character(' ')
            end

            f.read_character
         end

         std_output.put_new_line
         f.disconnect
      end

end -- class HEX_DUMP
