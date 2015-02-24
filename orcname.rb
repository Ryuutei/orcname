#!/usr/bin/ruby
# -*- coding: utf-8 -*-

=begin ========================================================================
#         USAGE: orcname.rb <clan> <number>
#   DESCRIPTION:
#       OPTIONS:
#  REQUIREMENTS: ruby 2
=end ==========================================================================
Author  = "Sebastien Blanc 龍帝〔ryuutei@gmail.com〕"
Doc     = "Returns a random orc name with a random clan tag"
Enc     = "utf8"
Version = "1"
Revision= "3"
#==============================================================================

$vowel    = ["a", "o", "u", "i", "e", ]

$startEntity = [
    "B", "Br",
    "Cr",
    "G", "Gr", "G’",
    "K’","Kr",
    "M", "M’",
    "S",
    "T", "Thr",
    "Z", "Z’",
]

$midLetter = [
    "d",
    "g", "gg",
    'h',
    "m",
]

$endLetter = [
    "k",
    "r",
    "rth",
    "th",
    "ng",
]

$clanStart = [
    "Ball",
    "Bat",
    "Bear",
    "Blood",
    "Cave",
    "Foot",
    "Night",
    "Nut",
    "Orc", "Man",
    "Rock",
    "Skull",
    "Spear",
    "Troll",
    "Dog", "Wolf", 
]

$clanEnd = [
    "axe",
    "bone",
    "claw",
    "crusher",
    "eater",
    "fang",
    "killer",
    "slammer",
    "smasher",
    "tooth",
]

#===============================================================================

def main
    χi = $*.clone
    if χi.length == 0 then 
        puts englorc false
    elsif χi.index "clan" then
        χi.delete_at(χi.index "clan")
        χi[0].to_i.times { puts englorc true }
    else
        χi[0].to_i.times { puts englorc false }
    end
end

def englorc(clan=true)
    if clan == true then
        "#{masterOrcName} #{masterClan}"
    else masterOrcName
    end
end

def masterOrcName
    im = "#{orcNameStart}#{orcNameMid}#{orcNameEnd}"
    rand(3).times { im += " #{orcNameStart}#{orcNameEnd}" }
    return im.capitalize
end

def masterClan ; "#{$clanStart[rand($clanStart.length)]}#{$clanEnd[rand($clanEnd.length)]}" end

def orcNameStart
    χt = rand
    if χt < 0.7 then
        "#{$vowel[rand($vowel.length)]}#{orcNameMid}#{$vowel[rand($vowel.length() -1)]}"
    elsif χt < 0.3 then
        "#{$startEntity[rand($startEntity.length)]} #{$vowel[rand($vowel.length() -1)]}"
    else
        $startEntity[rand($startEntity.length)]
    end
end

def orcNameMid
    # Returns a middle particule for the orc name.
    "#{$midLetter[rand($midLetter.length)]}#{$vowel[rand($vowel.length() -1)]}"
end

def orcNameEnd ; $endLetter[rand($endLetter.length)] end

main
