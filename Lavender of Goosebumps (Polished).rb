# Welcome to Sonic Pi v3.1
rain = "C:/Users/Matthew/Documents/Audacity/rainfall.wav"
run = "C:/Users/Matthew/Documents/Audacity/Running 2.0.wav"
door = "C:/Users/Matthew/Documents/Audacity/door opening and shutting.wav"
wind = "C:/Users/Matthew/Documents/Audacity/Winned.wav"
music_box = "C:/Users/Matthew/Documents/Audacity/Music Box.wav"
crash = "C:/Users/Matthew/Documents/Audacity/Shatter.wav"
reverse = "C:/Users/Matthew/Documents/Audacity/Falling Glass Reverse.wav"
beat = "C:/Users/Matthew/Documents/Audacity/Golden Ticket.wav"
chorus = "C:/Users/Matthew/Documents/Audacity/harmony.wav"
ch1 ="C:/Users/Matthew/Documents/Audacity/ghost.wav"
ch2 = "C:/Users/Matthew/Documents/Audacity/hoo.wav"
ch3 = "C:/Users/Matthew/Documents/Audacity/nark.wav"
verse_one = "C:/Users/Matthew/Documents/Audacity/Verse One.wav"
verse_two = "C:/Users/Matthew/Documents/Audacity/Goosebumps.wav"
beat_two = "C:/Users/Matthew/Documents/Audacity/Right here.wav"
thunder = "C:/Users/Matthew/Documents/Audacity/Thunder.wav"


#Array1
high_notes = [:c5, :g5, :b5, :fs5]
x = 0
n = 0.4

#Array2
goose_notes = [:d5, :e5, :f5, :a5, :e5, :f5]
o = 0

#Function
define :notes1 do
  play :c5, amp: 0.2
  sleep 1
  play :g5, amp: 0.2
  sleep 1
  play :b5, amp: 0.2
  sleep 1
  play :fs5, amp: 0.2
  sleep 1
end

#Parameterised Function
define :low_function do |n1, n2, n3, n4, n5, n6|
  play n1, amp: 2
  play n2, amp: 2
  sleep 1
  play n3, amp: 2
  sleep 1
  play n4, amp: 2
  play n5, amp: 2
  sleep 1
  play n6, amp: 2
end

#Intro
sample rain
sleep 1
sample run, amp: 3
sleep 6
sample door
sleep 1.2
sample music_box
sleep 21
sample crash
sleep 2
sample reverse
sleep 2
sample wind
sleep 5

#Function
use_synth :pretty_bell
use_bpm 100
notes1

#Background-Chorus
sample chorus, amp: 2


#Verse 1 (Amp Increase)
16.times do
  play high_notes [x], amp: n
  sleep 1
  x = x + 1
  print x
  if
    x == 4
    x = 0
    n = n + 0.2
  end
end


use_bpm 125
live_loop :high do
  16.times do
    sample verse_one
    sleep 4
  end
  stop
end

#Background-Beat
live_loop :dope do
  9.times do
    sample beat, amp: 3, rate: 0.7
    sleep 8
  end
  stop
end


#Verse 2 Low Notes
3.times do
  use_synth :piano
  with_fx :mono do
    2.times do
      play :g4, sustain: 2, amp: 4
      play :e4, sustain: 4, amp: 4
      sleep 2
      play :g4, amp: 4
      sleep 2
    end
  end
  
  #Verse 3
  use_synth :piano
  with_fx :pitch_shift do
    play :g4, amp: 4
    play :e4, amp: 4
    sleep 1
    play :fs, amp: 4
    sleep 1
    play :e4, amp: 4
    sleep 1
    play :b4, amp: 4
    sleep 1
  end
  
  #Verse 4
  low_function :e4, :cs, :c4, :cs, :b3, :e4
  
  sample choose ([ch1, ch2, ch3])
  sleep 1.5
  
  #Verse 5
  low_function :b4, :d4, :g4, :fs, :f4, :b4
  
  #Verse 6
  low_function :e4, :c5, :c4, :d3, :b4, :e4
  #Random Function
  sample choose ([ch1, ch2, ch3])
  sleep 2
end



sleep 1

#Transition
sample thunder
sleep 3
sample wind, rate: 2.5, amp: 7
sleep 6

#Second Verse
use_bpm 100
use_synth :piano
play :d3, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :d5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :d5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :c5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :c5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :b4, amp: 2
sleep 1

live_loop :goose do
  60.times do
    play goose_notes [o]
    sleep 0.25
    o = o + 1
    if
      o == 6
      o = 0
    end
  end
  stop
end

live_loop :sick_beat do
  8.times do
    sample beat_two
    sleep 2
  end
  stop
end

sleep 16

play :d3, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :d5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :d5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :c5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :c5, amp: 2
sleep 0.5
play :f4, amp: 2
play :a4, amp: 2
play :b4, amp: 2

sample crash