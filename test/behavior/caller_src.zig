const std = @import("std");

fn callerSrcReporter() []const std.builtin.SourceLocation {
    const caller = @callerSrc();
    return caller[0..];
}

test "@callerSrc() behavior" {
    const locs = callerSrcReporter();

    try std.testing.expectEqual(@as(usize, 1), locs.len);
    try std.testing.expectEqual(@as(usize, 9), locs[0].line);
    try std.testing.expectEqual(@as(usize, 18), locs[0].column);
    try std.testing.expectEqualStrings("test.@callerSrc() behavior", locs[0].fn_name);
}
