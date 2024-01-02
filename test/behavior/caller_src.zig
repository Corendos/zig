const std = @import("std");

fn callerSrcReporter() std.builtin.SourceLocation {
    const caller = @callerSrc();
    return caller;
}

test "@callerSrc() behavior" {
    const loc = callerSrcReporter();

    try std.testing.expectEqual(@as(usize, 9), loc.line);
    try std.testing.expectEqual(@as(usize, 17), loc.column);
    try std.testing.expectEqualStrings("test.@callerSrc() behavior", loc.fn_name);
}
