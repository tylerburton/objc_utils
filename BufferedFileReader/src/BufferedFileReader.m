/*
 * BufferedFileReader.h
 *
 * Copyright (C) 2015 - Tyler Burton
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

/*
 * Objective-C imports
 */
#import "BufferedFileReader.h"

@implementation BufferedFileReader

-(id)initWithFile:(NSString *) filePath
{
	if([super init])
	{
		buffer = [[[NSString stringWithContentsOfFile:filePath] componentsSeparatedByString:@"\n"] retain];
	}
	
	return self;
}

-(NSString *)readLine
{
	// Make sure there is actually something to return
	if((bufferIndex + 1) > [buffer count])
	{
		return nil;
	}
	
	// Get value to return
	NSString *retVal = [buffer objectAtIndex:bufferIndex++];
	
	// On last index make sure the value contains something before returning
	if(bufferIndex == [buffer count] && [retVal isEqualToString:@""])
	{
		return nil;
	}
	else
	{
		return retVal;
	}
}

-(void)reset
{
	bufferIndex = 0;
}

-(void)dealloc
{
	[buffer release];	
	[super dealloc];
}

@end
