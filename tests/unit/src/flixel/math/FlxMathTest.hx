package flixel.math;

import massive.munit.Assert;

class FlxMathTest extends FlxTest
{
	static var evenNumbers = [0, 2, 4, -4, 100, 1000000];
	static var oddNumbers = [1, 3, 5, -5, 99, 999999];
	
	@Test
	function testIsOdd()
	{
		for (evenNumber in evenNumbers)
			Assert.isFalse(FlxMath.isOdd(evenNumber));

		for (oddNumber in oddNumbers)
			Assert.isTrue(FlxMath.isOdd(oddNumber));
	}
	
	@Test
	function testIsEven()
	{
		for (evenNumber in evenNumbers)
			Assert.isTrue(FlxMath.isEven(evenNumber));
	
		for (oddNumber in oddNumbers)
			Assert.isFalse(FlxMath.isEven(oddNumber));
	}
	
	@Test
	function testSignOf()
	{
		Assert.areEqual(-1, FlxMath.signOf(-1));
		Assert.areEqual(1, FlxMath.signOf(0));
		Assert.areEqual(1, FlxMath.signOf(1));
	}
	
	@Test
	function testSameSign()
	{
		Assert.isTrue(FlxMath.sameSign(0, 0));
		Assert.isTrue(FlxMath.sameSign(1, 100));
		Assert.isTrue(FlxMath.sameSign(-5, -30));
		Assert.isFalse(FlxMath.sameSign(-5, 1));
	}
	
	@Test
	function testFastTrig()
	{
		var eps = 0.0011; // max error is 0.001090292749970 or so
		
		var angles = [for (i in 0...100) (Math.random() - .5) * i];
		angles.push(0);
		angles.push(Math.PI);
		angles.push( -Math.PI);
		
		var maxError = 0.0;
		for (angle in angles)
		{
			var eSin = Math.abs(FlxMath.fastSin(angle) - Math.sin(angle));
			var eCos = Math.abs(FlxMath.fastCos(angle) - Math.cos(angle));
			if (eSin > maxError) maxError = eSin;
			if (eCos > maxError) maxError = eCos;
		}
		
		Assert.isTrue(eps > maxError);
	}
}
