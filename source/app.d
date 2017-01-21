version (Windows)
{
	import core.runtime;
	import core.sys.windows.windows;
	import std.string;

	extern (Windows)
	int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
				LPSTR lpCmdLine, int nCmdShow)
	{
		int result;

		try
		{
			Runtime.initialize();
			result = myWinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow);
			Runtime.terminate();
		}
		catch (Throwable e)
		{
			MessageBoxA(null, e.toString().toStringz(), null,
						MB_ICONEXCLAMATION);
			result = 0;     // failed
		}

		return result;
	}

	int myWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
				LPSTR lpCmdLine, int nCmdShow)
	{
		return 0;
	}
}

version(linux)
{
	import xcb.xcb;
	import std.stdio;

	int main()
	{
		int screen_num = -1;
		auto conn = xcb_connect(null, &screen_num);
		writeln("connected on screen ", screen_num);
		xcb_disconnect(conn);
		return 0;
	}
}

unittest
{
	assert(1+1 == 2);
}
