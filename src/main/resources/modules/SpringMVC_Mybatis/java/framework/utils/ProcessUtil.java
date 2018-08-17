package ${basePackage}.framework.utils;

import java.awt.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 程序操作工具
 *
 * @author
 * @version 0.0.1
 * @since 2017-01-01
 */
public class ProcessUtil {
    /**
     * 启动windows系统下的exe文件
     * @param path 可执行exe文件路径
     */
    public static void execExe(String path) {
        Runtime rn = Runtime.getRuntime();
        Process p = null;
        try {
            p = rn.exec(path);
        } catch (Exception e) {
            System.out.println("Error exec!");
        }
    }

    /**
     * 执行windows批处理文件路
     * @param path 可执行批处理文件路径
     */
    public static void execBat(String path) {
        Runtime rn = Runtime.getRuntime();
        Process p = null;
        try {
            p = rn.exec(path);
        } catch (Exception e) {
            System.out.println("Error exec!");
        }
    }

    /**
     * 执行windows cmd命令
     * @param command cmd命令
     */
    public static String execCmd(String command) {
        return exec("cmd /c " + command);
    }


    /**
     * 执行运行环境命令
     * @param command cmd命令
     */
    public static String exec(String command) {
        StringBuilder build = new StringBuilder();
        Runtime runtime = Runtime.getRuntime();
        Process process = null;
        try {
            process = runtime.exec(command);
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "UTF-8"));
            String line = null;
            while ((line = br.readLine()) != null) {
                build.append(line);
            }
            process.destroy();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return build.toString();
    }

    /**
     * @throws IOException
     * @desc 杀死进程
     * @author zp
     * @date 2018-3-29
     */
    public static void killProc(String processName) throws IOException {
        if (processName != null && !"".equals(processName)) {
            execCmd("taskkill /F /IM " + processName);
        }
    }

    /**
     * @desc 判断进程是否开启
     * @author zp
     * @date 2018-3-29
     */
    public static boolean findProcess(String processName) {
        BufferedReader bufferedReader = null;
        try {
            Process proc = Runtime.getRuntime().exec("tasklist -fi " + '"' + "imagename eq " + processName + '"');
            bufferedReader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            while ((line = bufferedReader.readLine()) != null) {
                if (line.contains(processName)) {
                    return true;
                }
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (Exception ex) {
                }
            }
        }
    }

    public static void main(String[] args) {
//        try {//调用bat文件，出现黑窗口
//            executeCmd("cmd /k start E:\\windows_amd64\\sunny.bat");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        try {
//            executeCmd("E:\\windows_amd64\\sunny.exe clientid 213609147996,201822147996");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        execExe("D:\\windows_amd64\\sunny.exe clientid 213609147996,201822147996");
//        execBat("D:\\windows_amd64\\exec.bat");
//        System.out.println("===================");
//        System.out.println(s);
//        System.out.println("===================");
    }
}
