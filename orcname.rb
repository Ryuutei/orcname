#!/usr/bin/ruby
# -*- coding: utf-8 -*-

=begin ========================================================================
#         USAGE: orcname.rb <true|false>
#   DESCRIPTION:
#       OPTIONS:
#  REQUIREMENTS: ruby 1.8.7
#       CREATED:
=end ==========================================================================
__author__  = "Ryuutei, (ryuutei.at.work@gmail.com)"
__doc__     = "Returns a random orc name with a random clan tag"
__version__ = "1"
#==============================================================================

$vowel    = ['a', 'o','u']
$vowelCap = ['A', 'E', 'O', 'U']

$startEntity = [
    "B"     , "Br"    ,
    "Cr"    ,
    "G"     , "Gr"    , "G'"    ,
    "K'"    , "Kr"    ,
    "M"     ,
    "S"     ,
    "T"     , "Thr",
    "Z"     , "Z'" ]

$midletter = [
    "d" ,
    "g" , "gg",
    'h' ,
    "m" ]

$endletter = [
    "k"  ,
    "r"  ,
    "rth",
    "th" ,
    "ng" ]

$clanStart = [
    "Ball"  ,
    "Bat"   ,
    "Bear"  ,
    "Blood" ,
    "Cave"  ,
    "Dog"   ,
    "Foot"  ,
    "Night" ,
    "Nut"   ,
    "Orc"   ,
    "Rock"  ,
    "Skull" ,
    "Spear" ,
    "Troll" ,
    "Wolf" ]

$clanEnd = [
    "axe"    ,
    "bone"   ,
    "claw"   ,
    "crusher",
    "eater"  ,
    "fang"   ,
    "killer" ,
    "slammer",
    "smasher",
    "tooth"  ]

#===============================================================================

def englorc(clan=true)
    if clan == true then
        "#{masterOrcName} #{masterClan}"
    else masterOrcName end
end

def masterClan ; "#{rnd($clanStart)}#{rnd($clanEnd)}" end

def masterOrcName
    ii = 0..rand(2)
    im = "#{orcNameStart}#{orcNameMid}#{orcNameEnd}"
    if ii != 0 then
        ii.each { im += " #{orcNameStart}#{orcNameEnd}" }
    end
    return im
end

def orcNameStart
    some = rand
    if some < 0.7 then
        "#{rnd($vowelCap)}#{orcNameMid}#{rnd($vowel)}"
    elsif some < 0.3 then
        "#{rnd($startEntity)} #{rnd($vowel)}"
    else
        "#{rnd($startEntity)}"
    end
end

def orcNameMid 
    rnd($midletter) + rnd($vowel) end

def orcNameEnd 
    rnd($endletter) end

def rnd(liste)
    return "#{liste[rand(liste.length)]}" end

#if $* == [] then
#    puts englorc()
#elsif $*[0] == 'false' then
#    puts englorc()
#elsif $*[0] == 'true' then
#    puts englorc(true)
#end

(0..20).each { puts englorc(true) }
