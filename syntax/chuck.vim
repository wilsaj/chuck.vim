if exists("b:current_syntax")
    finish
endif

syntax keyword chuckBoolean true false maybe
syntax keyword chuckBoolean null NULL
highlight link chuckBoolean Boolean

syntax match chuckComment "\v//.*$"
syntax region  chuckComment start="/\*"  end="\*/"
highlight link chuckComment Comment

syntax keyword chuckConditional if else
highlight link chuckConditional Conditional

syntax keyword chuckKeyword fun function
syntax keyword chuckKeyword return
syntax keyword chuckKeyword const
syntax keyword chuckKeyword new
syntax keyword chuckKeyword now
syntax keyword chuckKeyword pi
syntax keyword chuckKeyword me
syntax keyword chuckKeyword samp ms second minute hour day week
syntax keyword chuckKeyword repeat break continue
syntax keyword chuckKeyword class extends public private static pure this
syntax keyword chuckKeyword spork
syntax keyword chuckKeyword cherr chout
highlight link chuckKeyword Keyword


syntax keyword chuckOperator => @=> =^
syntax keyword chuckOperator + - * /
syntax keyword chuckOperator %
syntax keyword chuckOperator "&&" "||" == != >=
syntax keyword chuckOperator & + ^
syntax keyword chuckOperator ++ --
syntax keyword chuckOperator ! + -
syntax keyword chuckOperator <<< >>>
highlight link chuckOperator Operator

syntax keyword chuckRepeat while until for do
highlight link chuckRepeat Repeat

syntax keyword chuckType int float time dur void string
syntax keyword chuckType array ugen complex polar
syntax keyword chuckType Object Event UGen
highlight link chuckType Type


syntax keyword chuckBuiltinUGen adc blackhole dac
syntax keyword chuckBuiltinUGen Gain
syntax keyword chuckBuiltinUGen Noise Impulse Step
syntax keyword chuckBuiltinUGen Phasor Osc SinOsc PulseOsc SqrOsc TriOsc SawOsc
syntax keyword chuckBuiltinUGen Gen5 Gen7 Gen9 Gen10 Gen17
syntax keyword chuckBuiltinUGen CurveTable WarpTable
syntax keyword chuckBuiltinUGen BiQuad OneZero TwoZero OnePole TwoPole PoleZero
syntax keyword chuckBuiltinUGen Filter LPF HPF BPF BRF ResonZ Dynamics
syntax keyword chuckBuiltinUGen HalfRect FullRect ZeroX
syntax keyword chuckBuiltinUGen SndBuf
syntax keyword chuckBuiltinUGen Mix2 Pan2
syntax keyword chuckBuiltinUGen StkInstrument BandedWG
syntax keyword chuckBuiltinUGen BlowBotl BlowHole Bowed Brass Clarinet Flute
syntax keyword chuckBuiltinUGen Mandolin ModalBar Moog Saxofony Shakers
syntax keyword chuckBuiltinUGen Sitar StifKarp VoicForm
syntax keyword chuckBuiltinUGen FM BeeThree FMVoices HevyMetl PercFlut Rhodey TubeBell Wurley
syntax keyword chuckBuiltinUGen Delay DelayA DelayL Echo
syntax keyword chuckBuiltinUGen Envelope ADSR
syntax keyword chuckBuiltinUGen JCRev NRev PRCRev
syntax keyword chuckBuiltinUGen Chorus Modulate PitShift SubNoise Blit BlitSaw BlitSquare
syntax keyword chuckBuiltinUGen WvIn WaveLoop WvOut
syntax keyword chuckBuiltinUGen GenX LiSa Dyno
syntax keyword chuckBuiltinUGen Chugen Chubgraph
highlight link chuckBuiltinUGen Structure

syntax keyword chuckBuiltinUAna UAna UAnaBlob Windowing
syntax keyword chuckBuiltinUAna FFT IFFT DCT IDCT
syntax keyword chuckBuiltinUAna Centroid Flux RMS RollOff
syntax keyword chuckBuiltinUAna Flip pilF
highlight link chuckBuiltinUAna Structure

syntax keyword chuckChugin ABSaturator AmbPan Bitcrusher Elliptic ExpDelay FIR
syntax keyword chuckChugin FluidSynth GVerb KasFilter Ladspa MagicSine Mesh2D
syntax keyword chuckChugin Multicomb Overdrive PanN PitchTrack PowerADSR Sigmund
syntax keyword chuckChugin Spectacle WinFuncEnv
highlight link chuckChugin Structure

syntax keyword chuckEvent OscRecv OscSend OscEvent OscOut OscIn OscMsg
syntax keyword chuckEvent MidiIn MidiOut MidiMsg
syntax keyword chuckEvent KBHit Hid HidMsg
highlight link chuckEvent Special

syntax keyword chuckIO Machine RegEx FileIO SerialIO StringTokenizer ConsoleInput
highlight link chuckIO Special

syntax keyword chuckLib Math Std
highlight link chuckLib Special


syntax match chuckNumber /\%(\i\|\$\)\@<![-]\?\d\+/ display
highlight link chuckNumber Number

syntax match chuckHex /\<0[xX]\x\+[lL]\=\>/ display
highlight link chuckHex Number

syntax match chuckFloat /\%(\i\|\$\)\@<![-]\?\%(\d*\.\d\+\|\d\+\.\)/ display
highlight link chuckFloat Float

syntax region chuckString start=/"/ end=/"/ display
highlight link chuckString String

let b:current_syntax = "chuck"

