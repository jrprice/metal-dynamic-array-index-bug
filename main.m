#import <Metal/Metal.h>

bool CompileForDevice(id<MTLDevice> device) {
  printf("\nDevice: %s\n", [device.name UTF8String]);

  NSError *error = nil;
  NSURL *url = [NSURL fileURLWithPath:@"shaders.metallib"];
  id<MTLLibrary> library = [device newLibraryWithURL:url error:&error];
  if (library == nil) {
    NSLog(@"Failed to load the library.");
    return false;
  }

  id<MTLFunction> vertexFunction = [library newFunctionWithName:@"vert_main"];
  if (vertexFunction == nil) {
    NSLog(@"Failed to find the vertex function.");
    return false;
  }

  id<MTLFunction> fragFunction = [library newFunctionWithName:@"frag_main"];
  if (fragFunction == nil) {
    NSLog(@"Failed to find the fragment function.");
    return false;
  }

  MTLRenderPipelineDescriptor *pipelineDescriptor = [[MTLRenderPipelineDescriptor alloc] init];
  pipelineDescriptor.vertexFunction = vertexFunction;
  pipelineDescriptor.fragmentFunction = fragFunction;

  id<MTLRenderPipelineState> pipeline =
    [device newRenderPipelineStateWithDescriptor:pipelineDescriptor error:&error];
  if (pipeline == nil) {
    NSLog(@"Failed to created pipeline state object, error %@.", error);
    return false;
  }

  printf("Render pipeline created successfully.\n");

  return true;
}

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    NSArray<id<MTLDevice>>* devices = MTLCopyAllDevices();
    for (id<MTLDevice> device in devices) {
      if (!CompileForDevice(device)) {
        return 1;
      }
    }
  }
  return 0;
}
