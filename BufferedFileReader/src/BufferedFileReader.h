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
#import <Foundation/Foundation.h>

/**
 * This class reads the contents of a file into an internal buffer from which
 * it can then return individual lines (based on found newlines).
 */
@interface BufferedFileReader : NSObject
{
	NSArray *buffer;
	int bufferIndex;
}

/**
 * Init the BufferedFileReader with a path to a file
 *
 * @param filePath
 *  the location of the file to read from
 *
 * @return newly created BufferedFileReader
 */
-(id)initWithFile:(NSString *) filePath;

/**
 * Reads the next line from the buffered file contents
 *
 * @return the next line from the file or nil if there are no lines left
 */
-(NSString *)readLine;

/**
 * Resets the internal buffer so that the next readLine call will return the 
 * first line from the file
 *
 * @see readLine
 */
-(void)reset;

@end
