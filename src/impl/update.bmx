
Rem
Copyright (c) 2010 Christiaan Kras

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
End Rem

Rem
	bbdoc: Maximus 'update' argument implementation.
End Rem
Type mxUpdateImpl Extends mxArgumentImplementation
	
	Method New()
		init(["update", "--update", "-u"])
	End Method
	
	Rem
		bbdoc: Check the current arguments for errors (according to the specific implementation).
		returns: Nothing.
		about: This method will throw an error if the given arguments are invalid.
	End Rem
	Method CheckArgs()
		Select GetCallConvention()
			Case mxCallConvention.COMMAND ' "update"
				If m_args <> Null
					ThrowCommonError(mxCmdErrors.DOESNOTTAKEPARAMS, "update")
				End If
			Case mxCallConvention.OPTION ' "-u" or "--update"
				If m_args <> Null
					ThrowCommonError(mxOptErrors.DOESNOTTAKEPARAMS, "-u|--update")
				End If
		End Select
	End Method
	
	Rem
		bbdoc: Get a string describing the typical usage of the argument.
		returns: A string describing the typical usage of the argument.
	End Rem
	Method GetUsage:String()
		Return "description: Retrieve latest sources~n" + ..
				"usage: maximus update (or maximus -u|--update)"
	End Method
	
	Rem
		bbdoc: Execute the implementation's operation.
		returns: Nothing.
	End Rem
	Method Execute()
		logger.LogMessage("Retrieving sources...")
	End Method
End Type
