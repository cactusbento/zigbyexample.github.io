const std = @import("std");

test {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const stdin = std.io.getStdIn();

    std.debug.print("input: ", .{});

    var input = std.ArrayList(u8).init(allocator);
    defer input.deinit();

    try stdin.reader().streamUntilDelimiter(input.writer(), '\n', 1024);

    std.debug.print("value: {s}\n", .{input.items});
}
