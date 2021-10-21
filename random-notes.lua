--- random notes
-- random quantized note generator
-- in1: clock in
-- in2:
-- out1: trigger 1
-- out2: quantized radnom note 1
-- out3: trigger 2
-- out4: quantized radnom note 2

scales =
{ octave = {0}
, chroma = {} -- this is a shortcut
, major  = {0,2,4,5,7,9,11}
, harMin = {0,2,3,5,7,8,10}
, dorian = {0,2,3,5,7,9,10}
, majTri = {0,4,7}
, dom7th = {0,4,7,10}
, wholet = {0,2,4,6,8,10}
}

scale = scales.major
transpose = 0
prob = 80

function init()
    input[1].mode('change',1.0,0.1,'rising')
    output[1].action = pulse(0.02,8) -- initialize trigger
    output[2].scale(scale)
    output[3].action = pulse(0.02,8) -- initialize trigger
    output[4].scale(scale)
end

input[1].change = function(state)
  randProb = math.floor(math.random() * 100) -- Random probability
  if prob > randProb then
    -- Output 1 + 2
    rand = math.random() * 10 - 5
    if rand < 0 then rand = rand * -1 end
    note = rand + transpose
    output[1].execute() -- fire trigger
    output[2].volts = note
    print(note)
  else
    -- Output 3 + 4
    rand = math.random() * 10 - 5
    if rand < 0 then rand = rand * -1 end
    note = rand + transpose
    output[3].execute() -- fire trigger
    output[4].volts = note
    print(note)
  end
end
