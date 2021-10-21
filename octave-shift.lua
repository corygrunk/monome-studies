--- octave shift
-- shift octaves
-- in1: cv in
-- out1: +1 octave
-- out2: original octave
-- out3: -1 octaves
-- out4: -2 octaves

function init()
  -- Get incoming voltage
  input[1].mode('stream', 0.02)
  input[1].stream = octave_shift
end

function octave_shift(v)
  -- Set each output to a different octave
  output[1].volts = v + 1
  output[2].volts = v
  output[3].volts = v - 1
  output[4].volts = v - 2
end
