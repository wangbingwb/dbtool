package ${basePackage}.framework;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * IDgenerator - ID生成器
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class IDgenerator {

    private static long workerId = 1L;
    private static long datacenterId = 1L;
    private static long sequence = 0L;
    // 时间起始标记点，作为基准，一般取系统的最近时间（一旦确定不能变动）
    private static long twepoch = 1531130104852L;
    // 机器标识位数
    private static long workerIdBits = 2L;//分布应用可设置为5，这里减少占位增加可支持时间
    // 数据中心标识位数
    private static long datacenterIdBits = 2L;//分布应用可设置为5，这里减少占位增加可支持时间
    // 机器ID最大值
    private static long maxWorkerId = -1L ^ (-1L << workerIdBits);
    // 数据中心ID最大值
    private static long maxDatacenterId = -1L ^ (-1L << datacenterIdBits);
    // 毫秒内自增位
    private static long sequenceBits = 12L;
    // 机器ID偏左移12位
    private static long workerIdShift = sequenceBits;
    // 数据中心ID左移17位
    private static long datacenterIdShift = sequenceBits + workerIdBits;
    // 时间毫秒左移22位
    private static long timestampLeftShift = sequenceBits + workerIdBits + datacenterIdBits;
    private static long sequenceMask = -1L ^ (-1L << sequenceBits);
    // 上次生产id时间戳
    private static long lastTimestamp = -1L;

    public static synchronized long nextId() {
        long timestamp = timeGen();

        if (timestamp < lastTimestamp) {
            throw new RuntimeException(String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
        }

        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & sequenceMask;
            if (sequence == 0) {
                timestamp = tilNextMillis(lastTimestamp);
            }
        } else {
            sequence = 0L;
        }

        lastTimestamp = timestamp;

        return ((timestamp - twepoch) << timestampLeftShift) | (datacenterId << datacenterIdShift) | (workerId << workerIdShift) | sequence;
    }

    protected static long tilNextMillis(long lastTimestamp) {
        long timestamp = timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = timeGen();
        }
        return timestamp;
    }

    protected static long timeGen() {
        return System.currentTimeMillis();
    }

    public static void main(String[] args) {

        Process p;
        try {
            p = Runtime.getRuntime().exec("E:\\windows_amd64\\sunny.exe clientid 213609147996,201822147996");
            System.out.println(":::::::::::::::::::开始在控制台打印日志::::::::::::::::::::::>>>>>>");
            //p.waitFor();
            BufferedReader bReader=new BufferedReader(new InputStreamReader(p.getInputStream(),"gbk"));
            String line=null;
            while((line=bReader.readLine())!=null)
                System.out.println(line);
        } catch (IOException e) {
            e.printStackTrace();
        }
//
//        for (int i = 0; i < 10; i++) {
//            long l = IDgenerator.nextId();
//            System.out.println(l);
//        }
    }
}
