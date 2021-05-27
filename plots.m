function plots(xq,compressed,decompressed)
    subplot(3,2,2);
    plot(xq);
    axis([ 0 200000 min(xq) max(xq)])
    grid on;
    xlabel('samples')
    ylabel('xq(t)')
    title('Input signal quantized')
    
    subplot(3,2,4);
    cla(gca);
    plot(compressed);hold on;
    %stem(compressed,'b-'); hold off;
    xlabel('samples');
    ylabel('x_dq(t)');
    title('Compressed signal (by A-law)');
    grid on;
    axis([0 200000 min(compressed) max(compressed)]);
    
    subplot(3,2,6);
    plot(decompressed, 'b');
    xlabel('samples');
    ylabel('x_dq(t)');
    grid on;
    title('Deompressed signal (by A-law)');
end

