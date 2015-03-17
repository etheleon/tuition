#!/usr/bin/env perl

use v5.20;

say "Is it constant acceleration?";
my $constantAcceleration = <>;
chomp $constantAcceleration;

say "What's the friction?";
my $friction = <>;
chomp $friction;

say "How many boxes?";
my $numBoxes = <>;
chomp $numBoxes;

say "Whats the pulling force?";
my $headForce = <>;
chomp $headForce;

my %tension;

my $frictionCount=0;
my $maCount=0;

if($constantAcceleration eq "yes")
{
    additionalOpposingForce($numBoxes);
    say "friction:", $frictionCount;
    say "ma:", $maCount;
    my $totalFriction = $frictionCount * $friction;
    say "friction:", $totalFriction;
    my $maValue = ($headForce - $totalFriction)/3;

    #my @array
    #calculateTension($friction, $maValue);
    $tension{1} = $friction + $maValue;
    $tension{2} = $friction + $maValue + $tension{1};
    $tension{3} = $friction + $maValue + $tension{2};

    say "ma = ", $maValue;
}

say "tension in the following";
say "$_\t$tension{$_}" for keys %tension;

#sub calculateTension{
    #my ($friction, $maValue, $numBoxes) = @_;

    #my $remainingBoxes = $numBoxes -1;
    #return eval{$friction + $maValue};
    #my $tension = calculateTension($friction, $maValue, $remainingBoxes)
#}

sub additionalOpposingForce {
    my $num = shift;
    return 0 if $num == 0;
    $frictionCount++;
    $maCount++;
    my $remainingBoxes = $num -1;
    additionalOpposingForce($remainingBoxes)
}
