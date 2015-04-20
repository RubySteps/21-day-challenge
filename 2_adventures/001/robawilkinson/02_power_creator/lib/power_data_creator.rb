require 'csv'
superpowers = %{
Adhesion

     Amphibious

     Animal control

     Animate/control the dead

     Autonomic function control



B:  Body duplication

     Body transformation

     Bullet-proof



C:  Chemical control 

     Clairvoyance

     Cold generation

     Computer hacking

     Cosmic awareness



D:  Danger sense

     Dark generation/control 

     Density control 

     Deus ex machina 

     Direct computer interface 



E:  Earthquake generation 

     Earth/rock control 

     Elasticity 

     Electrical generation/control 

     Electromagnetism 

    Empathy 

    Encyclopedic knowledge

    Energy absorption 

    Energy blasts 

    Energy manipulation 

    Enhanced agility

    Enhanced common sense 

    Enhanced senses 

    Enhanced senses 

    Escape artist 

    Explodes 

    Extra appendage(s) 

    Extra-dimensional travel

    Extreme popularity 



F: Flame generation/control 

    Flight Flight Flight 

    Force blasts 

    Force field generation 

    Friction manipulation 



G: Gadget creation 

    Glows in the dark 

    Growth 

    Gravity control 



H: Heat generation 

    Heat vision 

    Hold breath indefinitely 

    Hypnosis 



I:  Ice generation 

    Illusion casting 

    Image projection

    Immortality

    Incomprehensibility 

    Incredible balance 

    Insect control 

    Instant language understanding

    Intangibility 

    Intuition 

    Invisibility 

    Invulnerability Invulnerability Invulnerability 



J: Juggling 



L: Laser vision 

    Light generation/control 

    Luck 

    Lycanthrope 



M:  Machine control

     Magic spell casting 

     Magnetism 

    Martial arts mastery 

    Matter consumption 

    Microscopic vision 

    Mind control

    Mind-numbing beauty/ugliness 

    Molecular control



O: Odor generation 

    Omni directional sight

    Omnipotence

    Omniscience



P: Perfect pitch

    Photographic memory

    Plant control

    Poison resistance

    Power mimicry

    Precognition

    Prehensile tail

    Psychic

    Pyrokinesis



R: Radar sense

    Radiation generation/control

    Regeneration

    Reinforced skeleton



S: Seventh sense

   Shape-shifting

   Sharp shooting

   Shrinking

   Smoke generation/control

   Sound generation/control

   Speed reading

   Super breath

   Super hearing

  Super intelligence

   Super jumping

   Super loud voice

  Super speed

  Super spelling

  Super strength Super strength Super strength

  Super ventriloquism

  Super-human hand-eye coordination

  Super-human stamina

 Super-human throwing accuracy

  Super-human weight-guessing accuracy



T: Telekinesis

    Telepathy

    Teleportation

    Telescopic vision

    Time manipulation

    Time travel



W: Water control

     Weapon mastery

     Weather control

     Weather prediction



U: Unaided outer space travel



X:  X-ray vision}
superpowers =  superpowers.gsub(/^\s*\n/, '')
superpowers = superpowers.gsub(/.:/,'').lines.each do |line|
  line.strip!
end
CSV.open("superhero_data.csv", "wb") do |csv|
  superpowers.each do |line|
    csv << [line]
  end
end

