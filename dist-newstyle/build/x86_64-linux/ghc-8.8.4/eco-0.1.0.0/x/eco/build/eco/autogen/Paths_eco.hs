{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_eco (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/violet/.cabal/bin"
libdir     = "/home/violet/.cabal/lib/x86_64-linux-ghc-8.8.4/eco-0.1.0.0-inplace-eco"
dynlibdir  = "/home/violet/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/violet/.cabal/share/x86_64-linux-ghc-8.8.4/eco-0.1.0.0"
libexecdir = "/home/violet/.cabal/libexec/x86_64-linux-ghc-8.8.4/eco-0.1.0.0"
sysconfdir = "/home/violet/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "eco_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "eco_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "eco_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "eco_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "eco_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "eco_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
